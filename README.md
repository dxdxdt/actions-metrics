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
Updated: 2026-05-05T21:56:18.086219+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.867 |  |
| ap-east-1 | 0.810 |  |
| ap-east-2 | 0.746 |  |
| ap-northeast-1 | 0.627 |  |
| ap-northeast-2 | 0.736 |  |
| ap-northeast-3 | 0.660 |  |
| ap-south-1 | 0.831 |  |
| ap-south-2 | 0.903 |  |
| ap-southeast-1 | 0.892 |  |
| ap-southeast-2 | 0.825 |  |
| ap-southeast-3 | 0.947 |  |
| ap-southeast-4 | 0.856 |  |
| ap-southeast-5 | 0.910 |  |
| ap-southeast-6 | 0.859 |  |
| ap-southeast-7 | 0.986 |  |
| ca-central-1 | 0.115 | 16 |
| ca-west-1 | 0.268 |  |
| eu-central-1 | 0.385 |  |
| eu-central-2 | 0.410 |  |
| eu-north-1 | 0.454 |  |
| eu-south-1 | 0.414 |  |
| eu-south-2 | 0.420 |  |
| eu-west-1 | 0.306 |  |
| eu-west-2 | 0.341 |  |
| eu-west-3 | 0.360 |  |
| il-central-1 | 0.548 |  |
| me-central-1 | 0.761 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.237 |  |
| sa-east-1 | 0.486 |  |
| us-east-1 | 0.055 | 4602 |
| us-east-2 | 0.102 | 1567 |
| us-gov-east-1 | 0.099 | 1673 |
| us-gov-west-1 | 0.346 | 194 |
| us-west-1 | 0.292 | 3535 |
| us-west-2 | 0.335 | 157 |

