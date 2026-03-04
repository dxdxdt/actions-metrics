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
Updated: 2026-03-04T05:39:21.111828+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.942 |  |
| ap-east-1 | 0.744 |  |
| ap-east-2 | 0.690 |  |
| ap-northeast-1 | 0.567 |  |
| ap-northeast-2 | 0.677 |  |
| ap-northeast-3 | 0.593 |  |
| ap-south-1 | 0.889 |  |
| ap-south-2 | 0.908 |  |
| ap-southeast-1 | 0.819 |  |
| ap-southeast-2 | 0.763 |  |
| ap-southeast-3 | 0.879 |  |
| ap-southeast-4 | 0.773 |  |
| ap-southeast-5 | 0.839 |  |
| ap-southeast-6 | 0.766 |  |
| ap-southeast-7 | 0.924 |  |
| ca-central-1 | 0.162 | 16 |
| ca-west-1 | 0.258 |  |
| eu-central-1 | 0.451 |  |
| eu-central-2 | 0.467 |  |
| eu-north-1 | 0.507 |  |
| eu-south-1 | 0.472 |  |
| eu-south-2 | 0.486 |  |
| eu-west-1 | 0.367 |  |
| eu-west-2 | 0.406 |  |
| eu-west-3 | 0.432 |  |
| il-central-1 | 0.629 |  |
| me-central-1 | 0.820 |  |
| me-south-1 | 0.792 |  |
| mx-central-1 | 0.229 |  |
| sa-east-1 | 0.550 |  |
| us-east-1 | 0.115 | 4215 |
| us-east-2 | 0.127 | 1397 |
| us-gov-east-1 | 0.124 | 1527 |
| us-gov-west-1 | 0.244 | 169 |
| us-west-1 | 0.215 | 3168 |
| us-west-2 | 0.244 | 139 |

