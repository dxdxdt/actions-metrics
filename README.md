# Github Actions Metrics
Information on Github hosted runners like the Azure region they run on is
necessary info when optimising CD/CI pipelines(especially network latencies and
route path bandwidth). Github does not disclose it so I did it myself.

Using this info, place the resources(DB, object storage, other instances) near
the runners are usually run.

A few pieces of info I could gather online:

- Azure doesn't provide a list of VM service endpoints like AWS
- Github-hosted Actions runners are actually Azure VMs (surprisingly, not in a
  container)
- Github is hosted in the data centre somewhere in the US, probably in the same
  data centre where Azure is present

Microsoft definitely has more points of presence than any other cloud service
providers, but there's no official list of data center endpoints to ping. If you
look at the map,

<a href="https://aws.amazon.com/about-aws/global-infrastructure/regions_az/">
<img src="image.png" style="width: 500px;">
</a>
<a href="https://datacenters.microsoft.com/globe/explore">
<img src="image-1.png" style="width: 500px;">
</a>

they're close enough. For most devs, all that matters is probably how close
their S3 buckets are to the Github Actions runners. Some AWS and Azure regions
are under the same roof, but then again, no official data.

## DATA
Updated: 2026-02-17T21:28:52.240554+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.014 |  |
| ap-east-1 | 0.705 |  |
| ap-east-2 | 0.639 |  |
| ap-northeast-1 | 0.524 |  |
| ap-northeast-2 | 0.617 |  |
| ap-northeast-3 | 0.544 |  |
| ap-south-1 | 0.893 |  |
| ap-south-2 | 0.908 |  |
| ap-southeast-1 | 0.784 |  |
| ap-southeast-2 | 0.672 |  |
| ap-southeast-3 | 0.835 |  |
| ap-southeast-4 | 0.708 |  |
| ap-southeast-5 | 0.807 |  |
| ap-southeast-6 | 0.720 |  |
| ap-southeast-7 | 0.885 |  |
| ca-central-1 | 0.217 | 16 |
| ca-west-1 | 0.194 |  |
| eu-central-1 | 0.530 |  |
| eu-central-2 | 0.555 |  |
| eu-north-1 | 0.565 |  |
| eu-south-1 | 0.555 |  |
| eu-south-2 | 0.551 |  |
| eu-west-1 | 0.449 |  |
| eu-west-2 | 0.481 |  |
| eu-west-3 | 0.496 |  |
| il-central-1 | 0.715 |  |
| me-central-1 | 0.904 |  |
| me-south-1 | 0.857 |  |
| mx-central-1 | 0.245 |  |
| sa-east-1 | 0.625 |  |
| us-east-1 | 0.173 | 4136 |
| us-east-2 | 0.161 | 1353 |
| us-gov-east-1 | 0.157 | 1486 |
| us-gov-west-1 | 0.176 | 153 |
| us-west-1 | 0.148 | 3069 |
| us-west-2 | 0.183 | 126 |

