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
Updated: 2026-07-04T13:05:12.136639+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.881 |  |
| ap-east-1 | 0.796 |  |
| ap-east-2 | 0.739 |  |
| ap-northeast-1 | 0.621 |  |
| ap-northeast-2 | 0.722 |  |
| ap-northeast-3 | 0.647 |  |
| ap-south-1 | 0.835 |  |
| ap-south-2 | 0.873 |  |
| ap-southeast-1 | 0.887 |  |
| ap-southeast-2 | 0.768 |  |
| ap-southeast-3 | 0.926 |  |
| ap-southeast-4 | 0.815 |  |
| ap-southeast-5 | 0.900 |  |
| ap-southeast-6 | 0.806 |  |
| ap-southeast-7 | 0.976 |  |
| ca-central-1 | 0.128 | 16 |
| ca-west-1 | 0.288 |  |
| eu-central-1 | 0.394 |  |
| eu-central-2 | 0.415 |  |
| eu-north-1 | 0.455 |  |
| eu-south-1 | 0.424 |  |
| eu-south-2 | 0.434 |  |
| eu-west-1 | 0.314 |  |
| eu-west-2 | 0.357 |  |
| eu-west-3 | 0.372 |  |
| il-central-1 | 0.550 |  |
| me-central-1 | 0.803 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.238 |  |
| sa-east-1 | 0.502 |  |
| us-east-1 | 0.070 | 4819 |
| us-east-2 | 0.102 | 1652 |
| us-gov-east-1 | 0.105 | 1728 |
| us-gov-west-1 | 0.301 | 200 |
| us-west-1 | 0.238 | 3737 |
| us-west-2 | 0.302 | 164 |

