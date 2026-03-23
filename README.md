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
Updated: 2026-03-23T22:25:12.296156+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.876 |  |
| ap-east-1 | 0.799 |  |
| ap-east-2 | 0.740 |  |
| ap-northeast-1 | 0.617 |  |
| ap-northeast-2 | 0.728 |  |
| ap-northeast-3 | 0.641 |  |
| ap-south-1 | 0.837 |  |
| ap-south-2 | 0.897 |  |
| ap-southeast-1 | 0.876 |  |
| ap-southeast-2 | 0.787 |  |
| ap-southeast-3 | 0.941 |  |
| ap-southeast-4 | 0.837 |  |
| ap-southeast-5 | 0.904 |  |
| ap-southeast-6 | 0.837 |  |
| ap-southeast-7 | 0.990 |  |
| ca-central-1 | 0.113 | 16 |
| ca-west-1 | 0.289 |  |
| eu-central-1 | 0.387 |  |
| eu-central-2 | 0.419 |  |
| eu-north-1 | 0.451 |  |
| eu-south-1 | 0.426 |  |
| eu-south-2 | 0.420 |  |
| eu-west-1 | 0.314 |  |
| eu-west-2 | 0.344 |  |
| eu-west-3 | 0.362 |  |
| il-central-1 | 0.568 |  |
| me-central-1 | 0.774 |  |
| me-south-1 | 0.742 |  |
| mx-central-1 | 0.241 |  |
| sa-east-1 | 0.489 |  |
| us-east-1 | 0.057 | 4343 |
| us-east-2 | 0.085 | 1449 |
| us-gov-east-1 | 0.099 | 1597 |
| us-gov-west-1 | 0.322 | 190 |
| us-west-1 | 0.273 | 3288 |
| us-west-2 | 0.316 | 151 |

