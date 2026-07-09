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
Updated: 2026-07-09T19:25:27.545934+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.974 |  |
| ap-east-1 | 0.713 |  |
| ap-east-2 | 0.651 |  |
| ap-northeast-1 | 0.536 |  |
| ap-northeast-2 | 0.645 |  |
| ap-northeast-3 | 0.562 |  |
| ap-south-1 | 0.889 |  |
| ap-south-2 | 0.895 |  |
| ap-southeast-1 | 0.792 |  |
| ap-southeast-2 | 0.680 |  |
| ap-southeast-3 | 0.846 |  |
| ap-southeast-4 | 0.731 |  |
| ap-southeast-5 | 0.814 |  |
| ap-southeast-6 | 0.725 |  |
| ap-southeast-7 | 0.899 |  |
| ca-central-1 | 0.232 | 16 |
| ca-west-1 | 0.262 |  |
| eu-central-1 | 0.498 |  |
| eu-central-2 | 0.521 |  |
| eu-north-1 | 0.567 |  |
| eu-south-1 | 0.538 |  |
| eu-south-2 | 0.529 |  |
| eu-west-1 | 0.412 |  |
| eu-west-2 | 0.457 |  |
| eu-west-3 | 0.472 |  |
| il-central-1 | 0.648 |  |
| me-central-1 | 0.897 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.216 |  |
| sa-east-1 | 0.590 |  |
| us-east-1 | 0.150 | 4840 |
| us-east-2 | 0.171 | 1656 |
| us-gov-east-1 | 0.165 | 1733 |
| us-gov-west-1 | 0.222 | 201 |
| us-west-1 | 0.166 | 3760 |
| us-west-2 | 0.224 | 164 |

