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
Updated: 2026-04-08T06:17:27.443300+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.959 |  |
| ap-east-1 | 0.727 |  |
| ap-east-2 | 0.663 |  |
| ap-northeast-1 | 0.643 |  |
| ap-northeast-2 | 0.651 |  |
| ap-northeast-3 | 0.574 |  |
| ap-south-1 | 0.867 |  |
| ap-south-2 | 0.877 |  |
| ap-southeast-1 | 0.796 |  |
| ap-southeast-2 | 0.703 |  |
| ap-southeast-3 | 0.853 |  |
| ap-southeast-4 | 0.748 |  |
| ap-southeast-5 | 0.818 |  |
| ap-southeast-6 | 0.748 |  |
| ap-southeast-7 | 0.903 |  |
| ca-central-1 | 0.190 | 16 |
| ca-west-1 | 0.242 |  |
| eu-central-1 | 0.477 |  |
| eu-central-2 | 0.490 |  |
| eu-north-1 | 0.522 |  |
| eu-south-1 | 0.494 |  |
| eu-south-2 | 0.508 |  |
| eu-west-1 | 0.392 |  |
| eu-west-2 | 0.433 |  |
| eu-west-3 | 0.450 |  |
| il-central-1 | 0.651 |  |
| me-central-1 | 0.844 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.244 |  |
| sa-east-1 | 0.576 |  |
| us-east-1 | 0.139 | 4456 |
| us-east-2 | 0.151 | 1489 |
| us-gov-east-1 | 0.152 | 1634 |
| us-gov-west-1 | 0.228 | 192 |
| us-west-1 | 0.176 | 3374 |
| us-west-2 | 0.228 | 154 |

