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
Updated: 2026-05-30T23:55:28.751137+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.923 |  |
| ap-east-1 | 0.770 |  |
| ap-east-2 | 0.712 |  |
| ap-northeast-1 | 0.593 |  |
| ap-northeast-2 | 0.702 |  |
| ap-northeast-3 | 0.617 |  |
| ap-south-1 | 0.849 |  |
| ap-south-2 | 0.899 |  |
| ap-southeast-1 | 0.847 |  |
| ap-southeast-2 | 0.750 |  |
| ap-southeast-3 | 0.901 |  |
| ap-southeast-4 | 0.790 |  |
| ap-southeast-5 | 0.871 |  |
| ap-southeast-6 | 0.780 |  |
| ap-southeast-7 | 0.952 |  |
| ca-central-1 | 0.112 | 16 |
| ca-west-1 | 0.247 |  |
| eu-central-1 | 0.426 |  |
| eu-central-2 | 0.443 |  |
| eu-north-1 | 0.465 |  |
| eu-south-1 | 0.455 |  |
| eu-south-2 | 0.465 |  |
| eu-west-1 | 0.346 |  |
| eu-west-2 | 0.385 |  |
| eu-west-3 | 0.402 |  |
| il-central-1 | 0.587 |  |
| me-central-1 | 0.806 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.234 |  |
| sa-east-1 | 0.533 |  |
| us-east-1 | 0.088 | 4703 |
| us-east-2 | 0.084 | 1616 |
| us-gov-east-1 | 0.087 | 1708 |
| us-gov-west-1 | 0.266 | 195 |
| us-west-1 | 0.215 | 3623 |
| us-west-2 | 0.272 | 161 |

