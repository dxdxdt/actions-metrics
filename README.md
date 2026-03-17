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
Updated: 2026-03-17T19:51:31.956764+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.947 |  |
| ap-east-1 | 0.750 |  |
| ap-east-2 | 0.682 |  |
| ap-northeast-1 | 0.570 |  |
| ap-northeast-2 | 0.680 |  |
| ap-northeast-3 | 0.593 |  |
| ap-south-1 | 0.867 |  |
| ap-south-2 | 0.897 |  |
| ap-southeast-1 | 0.819 |  |
| ap-southeast-2 | 0.738 |  |
| ap-southeast-3 | 0.877 |  |
| ap-southeast-4 | 0.771 |  |
| ap-southeast-5 | 0.847 |  |
| ap-southeast-6 | 0.773 |  |
| ap-southeast-7 | 0.919 |  |
| ca-central-1 | 0.168 | 16 |
| ca-west-1 | 0.249 |  |
| eu-central-1 | 0.455 |  |
| eu-central-2 | 0.483 |  |
| eu-north-1 | 0.524 |  |
| eu-south-1 | 0.478 |  |
| eu-south-2 | 0.498 |  |
| eu-west-1 | 0.379 |  |
| eu-west-2 | 0.418 |  |
| eu-west-3 | 0.435 |  |
| il-central-1 | 0.625 |  |
| me-central-1 | 0.830 |  |
| me-south-1 | 0.789 |  |
| mx-central-1 | 0.238 |  |
| sa-east-1 | 0.564 |  |
| us-east-1 | 0.121 | 4298 |
| us-east-2 | 0.129 | 1430 |
| us-gov-east-1 | 0.135 | 1584 |
| us-gov-west-1 | 0.237 | 187 |
| us-west-1 | 0.192 | 3247 |
| us-west-2 | 0.237 | 148 |

