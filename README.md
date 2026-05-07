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
Updated: 2026-05-07T17:51:50.586629+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.941 |  |
| ap-east-1 | 0.758 |  |
| ap-east-2 | 0.686 |  |
| ap-northeast-1 | 0.571 |  |
| ap-northeast-2 | 0.680 |  |
| ap-northeast-3 | 0.608 |  |
| ap-south-1 | 0.893 |  |
| ap-south-2 | 0.961 |  |
| ap-southeast-1 | 0.829 |  |
| ap-southeast-2 | 0.746 |  |
| ap-southeast-3 | 0.881 |  |
| ap-southeast-4 | 0.789 |  |
| ap-southeast-5 | 0.840 |  |
| ap-southeast-6 | 0.784 |  |
| ap-southeast-7 | 0.935 |  |
| ca-central-1 | 0.127 | 16 |
| ca-west-1 | 0.250 |  |
| eu-central-1 | 0.464 |  |
| eu-central-2 | 0.465 |  |
| eu-north-1 | 0.496 |  |
| eu-south-1 | 0.478 |  |
| eu-south-2 | 0.490 |  |
| eu-west-1 | 0.383 |  |
| eu-west-2 | 0.414 |  |
| eu-west-3 | 0.445 |  |
| il-central-1 | 0.612 |  |
| me-central-1 | 0.829 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.200 |  |
| sa-east-1 | 0.568 |  |
| us-east-1 | 0.097 | 4608 |
| us-east-2 | 0.102 | 1571 |
| us-gov-east-1 | 0.113 | 1680 |
| us-gov-west-1 | 0.249 | 194 |
| us-west-1 | 0.203 | 3537 |
| us-west-2 | 0.247 | 157 |

