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
Updated: 2026-04-02T23:28:08.674989+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.011 |  |
| ap-east-1 | 0.695 |  |
| ap-east-2 | 0.639 |  |
| ap-northeast-1 | 0.512 |  |
| ap-northeast-2 | 0.630 |  |
| ap-northeast-3 | 0.535 |  |
| ap-south-1 | 0.893 |  |
| ap-south-2 | 0.894 |  |
| ap-southeast-1 | 0.766 |  |
| ap-southeast-2 | 0.656 |  |
| ap-southeast-3 | 0.834 |  |
| ap-southeast-4 | 0.700 |  |
| ap-southeast-5 | 0.789 |  |
| ap-southeast-6 | 0.699 |  |
| ap-southeast-7 | 0.870 |  |
| ca-central-1 | 0.226 | 16 |
| ca-west-1 | 0.215 |  |
| eu-central-1 | 0.528 |  |
| eu-central-2 | 0.534 |  |
| eu-north-1 | 0.581 |  |
| eu-south-1 | 0.544 |  |
| eu-south-2 | 0.562 |  |
| eu-west-1 | 0.445 |  |
| eu-west-2 | 0.472 |  |
| eu-west-3 | 0.498 |  |
| il-central-1 | 0.728 |  |
| me-central-1 | 0.891 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.235 |  |
| sa-east-1 | 0.637 |  |
| us-east-1 | 0.179 | 4422 |
| us-east-2 | 0.162 | 1475 |
| us-gov-east-1 | 0.160 | 1622 |
| us-gov-west-1 | 0.176 | 191 |
| us-west-1 | 0.125 | 3339 |
| us-west-2 | 0.183 | 153 |

