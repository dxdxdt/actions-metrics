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
Updated: 2025-08-28T03:31:17.392715+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.902 |  |
| ap-east-1 | 0.812 |  |
| ap-northeast-1 | 0.615 |  |
| ap-northeast-2 | 0.749 |  |
| ap-south-1 | 0.857 |  |
| ap-southeast-1 | 0.878 |  |
| ap-southeast-2 | 0.766 |  |
| ca-central-1 | 0.122 | 11 |
| eu-central-1 | 0.419 |  |
| eu-north-1 | 0.469 |  |
| eu-south-1 | 0.441 |  |
| eu-west-1 | 0.336 |  |
| eu-west-2 | 0.368 |  |
| eu-west-3 | 0.392 |  |
| me-south-1 | 0.777 |  |
| sa-east-1 | 0.521 |  |
| us-east-1 | 0.083 | 2899 |
| us-east-2 | 0.121 | 770 |
| us-gov-east-1 | 0.099 | 892 |
| us-gov-west-1 | 0.273 | 3 |
| us-west-1 | 0.241 | 1920 |
| us-west-2 | 0.274 |  |

