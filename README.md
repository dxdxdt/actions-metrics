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
Updated: 2026-03-22T16:21:27.205443+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.870 |  |
| ap-east-1 | 0.800 |  |
| ap-east-2 | 0.744 |  |
| ap-northeast-1 | 0.622 |  |
| ap-northeast-2 | 0.735 |  |
| ap-northeast-3 | 0.647 |  |
| ap-south-1 | 0.829 |  |
| ap-south-2 | 0.870 |  |
| ap-southeast-1 | 0.878 |  |
| ap-southeast-2 | 0.790 |  |
| ap-southeast-3 | 0.941 |  |
| ap-southeast-4 | 0.841 |  |
| ap-southeast-5 | 0.903 |  |
| ap-southeast-6 | 0.839 |  |
| ap-southeast-7 | 0.987 |  |
| ca-central-1 | 0.115 | 16 |
| ca-west-1 | 0.281 |  |
| eu-central-1 | 0.384 |  |
| eu-central-2 | 0.408 |  |
| eu-north-1 | 0.438 |  |
| eu-south-1 | 0.413 |  |
| eu-south-2 | 0.418 |  |
| eu-west-1 | 0.303 |  |
| eu-west-2 | 0.340 |  |
| eu-west-3 | 0.359 |  |
| il-central-1 | 0.553 |  |
| me-central-1 | 0.764 |  |
| me-south-1 | 0.722 |  |
| mx-central-1 | 0.247 |  |
| sa-east-1 | 0.482 |  |
| us-east-1 | 0.058 | 4332 |
| us-east-2 | 0.100 | 1446 |
| us-gov-east-1 | 0.100 | 1595 |
| us-gov-west-1 | 0.316 | 189 |
| us-west-1 | 0.273 | 3280 |
| us-west-2 | 0.321 | 151 |

