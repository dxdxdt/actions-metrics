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
Updated: 2026-10-03T18:37:15.039995+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.931 |  |
| ap-east-1 | 0.738 |  |
| ap-east-2 | 0.673 |  |
| ap-northeast-1 | 0.556 |  |
| ap-northeast-2 | 0.653 |  |
| ap-northeast-3 | 0.580 |  |
| ap-south-1 | 0.850 |  |
| ap-south-2 | 0.893 |  |
| ap-southeast-1 | 0.840 |  |
| ap-southeast-2 | 0.727 |  |
| ap-southeast-3 | 0.867 |  |
| ap-southeast-4 | 0.773 |  |
| ap-southeast-5 | 0.835 |  |
| ap-southeast-6 | 0.773 |  |
| ap-southeast-7 | 0.919 |  |
| ca-central-1 | 0.163 | 18 |
| ca-west-1 | 0.257 |  |
| eu-central-1 | 0.448 |  |
| eu-central-2 | 0.462 |  |
| eu-north-1 | 0.496 |  |
| eu-south-1 | 0.474 |  |
| eu-south-2 | 0.472 |  |
| eu-west-1 | 0.372 |  |
| eu-west-2 | 0.407 |  |
| eu-west-3 | 0.427 |  |
| il-central-1 | 0.612 |  |
| me-central-1 | 0.839 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.246 |  |
| sa-east-1 | 0.559 |  |
| us-east-1 | 0.116 | 5135 |
| us-east-2 | 0.129 | 1690 |
| us-gov-east-1 | 0.149 | 1932 |
| us-gov-west-1 | 0.245 | 237 |
| us-west-1 | 0.207 | 4153 |
| us-west-2 | 0.245 | 192 |

