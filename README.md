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
Updated: 2026-09-03T16:48:08.073212+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.065 |  |
| ap-east-1 | 0.629 |  |
| ap-east-2 | 0.571 |  |
| ap-northeast-1 | 0.450 |  |
| ap-northeast-2 | 0.554 |  |
| ap-northeast-3 | 0.478 |  |
| ap-south-1 | 0.897 |  |
| ap-south-2 | 0.879 |  |
| ap-southeast-1 | 0.728 |  |
| ap-southeast-2 | 0.603 |  |
| ap-southeast-3 | 0.761 |  |
| ap-southeast-4 | 0.646 |  |
| ap-southeast-5 | 0.724 |  |
| ap-southeast-6 | 0.633 |  |
| ap-southeast-7 | 0.807 |  |
| ca-central-1 | 0.286 | 18 |
| ca-west-1 | 0.168 |  |
| eu-central-1 | 0.575 |  |
| eu-central-2 | 0.594 |  |
| eu-north-1 | 0.629 |  |
| eu-south-1 | 0.610 |  |
| eu-south-2 | 0.621 |  |
| eu-west-1 | 0.499 |  |
| eu-west-2 | 0.535 |  |
| eu-west-3 | 0.557 |  |
| il-central-1 | 0.732 |  |
| me-central-1 | 0.970 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.253 |  |
| sa-east-1 | 0.693 |  |
| us-east-1 | 0.247 | 5080 |
| us-east-2 | 0.246 | 1685 |
| us-gov-east-1 | 0.232 | 1893 |
| us-gov-west-1 | 0.112 | 231 |
| us-west-1 | 0.083 | 4078 |
| us-west-2 | 0.114 | 191 |

