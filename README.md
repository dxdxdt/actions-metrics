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
Updated: 2026-02-15T08:24:34.681497+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.956 |  |
| ap-east-1 | 0.762 |  |
| ap-east-2 | 0.694 |  |
| ap-northeast-1 | 0.575 |  |
| ap-northeast-2 | 0.684 |  |
| ap-south-1 | 0.880 |  |
| ap-south-2 | 0.924 |  |
| ap-southeast-1 | 0.834 |  |
| ap-southeast-2 | 0.736 |  |
| ap-southeast-3 | 0.884 |  |
| ap-southeast-4 | 0.777 |  |
| ap-southeast-5 | 0.849 |  |
| ap-southeast-6 | 0.776 |  |
| ap-southeast-7 | 0.929 |  |
| ca-central-1 | 0.141 | 16 |
| ca-west-1 | 0.224 |  |
| eu-central-1 | 0.456 |  |
| eu-central-2 | 0.474 |  |
| eu-north-1 | 0.496 |  |
| eu-south-1 | 0.478 |  |
| eu-south-2 | 0.493 |  |
| eu-west-1 | 0.380 |  |
| eu-west-2 | 0.412 |  |
| eu-west-3 | 0.439 |  |
| il-central-1 | 0.625 |  |
| me-central-1 | 0.832 |  |
| me-south-1 | 0.799 |  |
| mx-central-1 | 0.239 |  |
| sa-east-1 | 0.560 |  |
| us-east-1 | 0.106 | 4123 |
| us-east-2 | 0.099 | 1342 |
| us-gov-east-1 | 0.101 | 1470 |
| us-gov-west-1 | 0.235 | 148 |
| us-west-1 | 0.222 | 3062 |
| us-west-2 | 0.237 | 125 |

