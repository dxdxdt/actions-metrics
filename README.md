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
Updated: 2026-04-09T20:42:13.712114+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.052 |  |
| ap-east-1 | 0.671 |  |
| ap-east-2 | 0.605 |  |
| ap-northeast-1 | 0.488 |  |
| ap-northeast-2 | 0.594 |  |
| ap-northeast-3 | 0.515 |  |
| ap-south-1 | 0.892 |  |
| ap-south-2 | 0.909 |  |
| ap-southeast-1 | 0.740 |  |
| ap-southeast-2 | 0.631 |  |
| ap-southeast-3 | 0.799 |  |
| ap-southeast-4 | 0.673 |  |
| ap-southeast-5 | 0.758 |  |
| ap-southeast-6 | 0.706 |  |
| ap-southeast-7 | 0.844 |  |
| ca-central-1 | 0.252 | 16 |
| ca-west-1 | 0.209 |  |
| eu-central-1 | 0.564 |  |
| eu-central-2 | 0.579 |  |
| eu-north-1 | 0.617 |  |
| eu-south-1 | 0.566 |  |
| eu-south-2 | 0.611 |  |
| eu-west-1 | 0.479 |  |
| eu-west-2 | 0.502 |  |
| eu-west-3 | 0.533 |  |
| il-central-1 | 0.741 |  |
| me-central-1 | 0.927 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.232 |  |
| sa-east-1 | 0.659 |  |
| us-east-1 | 0.197 | 4467 |
| us-east-2 | 0.189 | 1489 |
| us-gov-east-1 | 0.191 | 1637 |
| us-gov-west-1 | 0.154 | 192 |
| us-west-1 | 0.101 | 3384 |
| us-west-2 | 0.152 | 154 |

