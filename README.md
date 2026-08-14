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
Updated: 2026-08-14T12:45:18.082457+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.013 |  |
| ap-east-1 | 0.676 |  |
| ap-east-2 | 0.608 |  |
| ap-northeast-1 | 0.490 |  |
| ap-northeast-2 | 0.597 |  |
| ap-northeast-3 | 0.518 |  |
| ap-south-1 | 0.895 |  |
| ap-south-2 | 0.911 |  |
| ap-southeast-1 | 0.762 |  |
| ap-southeast-2 | 0.658 |  |
| ap-southeast-3 | 0.814 |  |
| ap-southeast-4 | 0.698 |  |
| ap-southeast-5 | 0.777 |  |
| ap-southeast-6 | 0.696 |  |
| ap-southeast-7 | 0.859 |  |
| ca-central-1 | 0.249 | 18 |
| ca-west-1 | 0.265 |  |
| eu-central-1 | 0.509 |  |
| eu-central-2 | 0.540 |  |
| eu-north-1 | 0.576 |  |
| eu-south-1 | 0.550 |  |
| eu-south-2 | 0.561 |  |
| eu-west-1 | 0.453 |  |
| eu-west-2 | 0.480 |  |
| eu-west-3 | 0.505 |  |
| il-central-1 | 0.679 |  |
| me-central-1 | 0.927 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.210 |  |
| sa-east-1 | 0.625 |  |
| us-east-1 | 0.180 | 4992 |
| us-east-2 | 0.216 | 1679 |
| us-gov-east-1 | 0.188 | 1826 |
| us-gov-west-1 | 0.190 | 222 |
| us-west-1 | 0.133 | 3946 |
| us-west-2 | 0.189 | 177 |

