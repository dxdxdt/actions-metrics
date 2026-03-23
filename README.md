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
Updated: 2026-03-23T12:47:36.160282+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.038 |  |
| ap-east-1 | 0.667 |  |
| ap-east-2 | 0.610 |  |
| ap-northeast-1 | 0.490 |  |
| ap-northeast-2 | 0.597 |  |
| ap-northeast-3 | 0.516 |  |
| ap-south-1 | 0.917 |  |
| ap-south-2 | 0.909 |  |
| ap-southeast-1 | 0.740 |  |
| ap-southeast-2 | 0.635 |  |
| ap-southeast-3 | 0.798 |  |
| ap-southeast-4 | 0.676 |  |
| ap-southeast-5 | 0.762 |  |
| ap-southeast-6 | 0.686 |  |
| ap-southeast-7 | 0.846 |  |
| ca-central-1 | 0.259 | 16 |
| ca-west-1 | 0.198 |  |
| eu-central-1 | 0.557 |  |
| eu-central-2 | 0.544 |  |
| eu-north-1 | 0.609 |  |
| eu-south-1 | 0.584 |  |
| eu-south-2 | 0.592 |  |
| eu-west-1 | 0.465 |  |
| eu-west-2 | 0.507 |  |
| eu-west-3 | 0.524 |  |
| il-central-1 | 0.742 |  |
| me-central-1 | 0.925 |  |
| me-south-1 | 0.877 |  |
| mx-central-1 | 0.226 |  |
| sa-east-1 | 0.659 |  |
| us-east-1 | 0.207 | 4338 |
| us-east-2 | 0.180 | 1448 |
| us-gov-east-1 | 0.185 | 1596 |
| us-gov-west-1 | 0.147 | 190 |
| us-west-1 | 0.119 | 3286 |
| us-west-2 | 0.148 | 151 |

