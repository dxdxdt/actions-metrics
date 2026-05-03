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
Updated: 2026-05-03T11:37:06.131055+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.930 |  |
| ap-east-1 | 0.758 |  |
| ap-east-2 | 0.696 |  |
| ap-northeast-1 | 0.580 |  |
| ap-northeast-2 | 0.699 |  |
| ap-northeast-3 | 0.613 |  |
| ap-south-1 | 0.833 |  |
| ap-south-2 | 0.914 |  |
| ap-southeast-1 | 0.841 |  |
| ap-southeast-2 | 0.759 |  |
| ap-southeast-3 | 0.899 |  |
| ap-southeast-4 | 0.812 |  |
| ap-southeast-5 | 0.855 |  |
| ap-southeast-6 | 0.790 |  |
| ap-southeast-7 | 0.943 |  |
| ca-central-1 | 0.118 | 16 |
| ca-west-1 | 0.251 |  |
| eu-central-1 | 0.449 |  |
| eu-central-2 | 0.453 |  |
| eu-north-1 | 0.505 |  |
| eu-south-1 | 0.462 |  |
| eu-south-2 | 0.476 |  |
| eu-west-1 | 0.366 |  |
| eu-west-2 | 0.389 |  |
| eu-west-3 | 0.419 |  |
| il-central-1 | 0.598 |  |
| me-central-1 | 0.800 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.206 |  |
| sa-east-1 | 0.532 |  |
| us-east-1 | 0.084 | 4590 |
| us-east-2 | 0.086 | 1561 |
| us-gov-east-1 | 0.088 | 1671 |
| us-gov-west-1 | 0.277 | 194 |
| us-west-1 | 0.218 | 3522 |
| us-west-2 | 0.280 | 157 |

