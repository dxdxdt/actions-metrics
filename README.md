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
Updated: 2026-07-12T10:20:00.822535+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.995 |  |
| ap-east-1 | 0.704 |  |
| ap-east-2 | 0.643 |  |
| ap-northeast-1 | 0.526 |  |
| ap-northeast-2 | 0.633 |  |
| ap-northeast-3 | 0.551 |  |
| ap-south-1 | 0.875 |  |
| ap-south-2 | 0.890 |  |
| ap-southeast-1 | 0.779 |  |
| ap-southeast-2 | 0.655 |  |
| ap-southeast-3 | 0.833 |  |
| ap-southeast-4 | 0.698 |  |
| ap-southeast-5 | 0.799 |  |
| ap-southeast-6 | 0.693 |  |
| ap-southeast-7 | 0.882 |  |
| ca-central-1 | 0.242 | 16 |
| ca-west-1 | 0.229 |  |
| eu-central-1 | 0.510 |  |
| eu-central-2 | 0.528 |  |
| eu-north-1 | 0.562 |  |
| eu-south-1 | 0.553 |  |
| eu-south-2 | 0.540 |  |
| eu-west-1 | 0.434 |  |
| eu-west-2 | 0.474 |  |
| eu-west-3 | 0.489 |  |
| il-central-1 | 0.673 |  |
| me-central-1 | 0.891 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.235 |  |
| sa-east-1 | 0.623 |  |
| us-east-1 | 0.182 | 4854 |
| us-east-2 | 0.192 | 1656 |
| us-gov-east-1 | 0.181 | 1739 |
| us-gov-west-1 | 0.184 | 202 |
| us-west-1 | 0.124 | 3771 |
| us-west-2 | 0.184 | 165 |

