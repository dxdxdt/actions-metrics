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
Updated: 2026-08-21T18:24:58.897425+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.897 |  |
| ap-east-1 | 0.791 |  |
| ap-east-2 | 0.732 |  |
| ap-northeast-1 | 0.615 |  |
| ap-northeast-2 | 0.719 |  |
| ap-northeast-3 | 0.640 |  |
| ap-south-1 | 0.843 |  |
| ap-south-2 | 0.889 |  |
| ap-southeast-1 | 0.865 |  |
| ap-southeast-2 | 0.761 |  |
| ap-southeast-3 | 0.928 |  |
| ap-southeast-4 | 0.825 |  |
| ap-southeast-5 | 0.888 |  |
| ap-southeast-6 | 0.803 |  |
| ap-southeast-7 | 0.972 |  |
| ca-central-1 | 0.126 | 18 |
| ca-west-1 | 0.256 |  |
| eu-central-1 | 0.419 |  |
| eu-central-2 | 0.439 |  |
| eu-north-1 | 0.456 |  |
| eu-south-1 | 0.441 |  |
| eu-south-2 | 0.452 |  |
| eu-west-1 | 0.334 |  |
| eu-west-2 | 0.366 |  |
| eu-west-3 | 0.397 |  |
| il-central-1 | 0.573 |  |
| me-central-1 | 0.811 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.236 |  |
| sa-east-1 | 0.553 |  |
| us-east-1 | 0.075 | 5038 |
| us-east-2 | 0.097 | 1680 |
| us-gov-east-1 | 0.103 | 1866 |
| us-gov-west-1 | 0.286 | 225 |
| us-west-1 | 0.239 | 4014 |
| us-west-2 | 0.288 | 184 |

