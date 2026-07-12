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
Updated: 2026-07-12T01:57:08.986931+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.881 |  |
| ap-east-1 | 0.822 |  |
| ap-east-2 | 0.763 |  |
| ap-northeast-1 | 0.645 |  |
| ap-northeast-2 | 0.748 |  |
| ap-northeast-3 | 0.670 |  |
| ap-south-1 | 0.822 |  |
| ap-south-2 | 0.870 |  |
| ap-southeast-1 | 0.897 |  |
| ap-southeast-2 | 0.764 |  |
| ap-southeast-3 | 0.954 |  |
| ap-southeast-4 | 0.810 |  |
| ap-southeast-5 | 0.916 |  |
| ap-southeast-6 | 0.802 |  |
| ap-southeast-7 | 1.000 |  |
| ca-central-1 | 0.121 | 16 |
| ca-west-1 | 0.268 |  |
| eu-central-1 | 0.390 |  |
| eu-central-2 | 0.424 |  |
| eu-north-1 | 0.453 |  |
| eu-south-1 | 0.437 |  |
| eu-south-2 | 0.434 |  |
| eu-west-1 | 0.321 |  |
| eu-west-2 | 0.357 |  |
| eu-west-3 | 0.374 |  |
| il-central-1 | 0.558 |  |
| me-central-1 | 0.793 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.243 |  |
| sa-east-1 | 0.500 |  |
| us-east-1 | 0.064 | 4853 |
| us-east-2 | 0.090 | 1656 |
| us-gov-east-1 | 0.101 | 1739 |
| us-gov-west-1 | 0.298 | 202 |
| us-west-1 | 0.242 | 3769 |
| us-west-2 | 0.299 | 165 |

