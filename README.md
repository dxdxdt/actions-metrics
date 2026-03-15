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
Updated: 2026-03-15T01:44:24.011177+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.940 |  |
| ap-east-1 | 0.755 |  |
| ap-east-2 | 0.686 |  |
| ap-northeast-1 | 0.562 |  |
| ap-northeast-2 | 0.674 |  |
| ap-northeast-3 | 0.590 |  |
| ap-south-1 | 0.875 |  |
| ap-south-2 | 0.915 |  |
| ap-southeast-1 | 0.829 |  |
| ap-southeast-2 | 0.724 |  |
| ap-southeast-3 | 0.892 |  |
| ap-southeast-4 | 0.764 |  |
| ap-southeast-5 | 0.842 |  |
| ap-southeast-6 | 0.820 |  |
| ap-southeast-7 | 0.924 |  |
| ca-central-1 | 0.161 | 16 |
| ca-west-1 | 0.269 |  |
| eu-central-1 | 0.448 |  |
| eu-central-2 | 0.462 |  |
| eu-north-1 | 0.496 |  |
| eu-south-1 | 0.481 |  |
| eu-south-2 | 0.474 |  |
| eu-west-1 | 0.369 |  |
| eu-west-2 | 0.405 |  |
| eu-west-3 | 0.425 |  |
| il-central-1 | 0.619 |  |
| me-central-1 | 0.827 |  |
| me-south-1 | 0.776 |  |
| mx-central-1 | 0.235 |  |
| sa-east-1 | 0.554 |  |
| us-east-1 | 0.111 | 4280 |
| us-east-2 | 0.120 | 1423 |
| us-gov-east-1 | 0.120 | 1576 |
| us-gov-west-1 | 0.238 | 185 |
| us-west-1 | 0.207 | 3233 |
| us-west-2 | 0.239 | 146 |

