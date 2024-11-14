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
Updated: 2024-11-14T08:17:28.958848

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.911 |  |
| ap-east-1 | 0.820 |  |
| ap-northeast-1 | 0.643 |  |
| ap-northeast-2 | 0.752 |  |
| ap-south-1 | 0.905 |  |
| ap-southeast-1 | 0.908 |  |
| ap-southeast-2 | 0.803 |  |
| ca-central-1 | 0.121 |  |
| eu-central-1 | 0.441 |  |
| eu-north-1 | 0.488 |  |
| eu-south-1 | 0.474 |  |
| eu-west-1 | 0.352 |  |
| eu-west-2 | 0.392 |  |
| eu-west-3 | 0.412 |  |
| me-south-1 | 0.803 |  |
| sa-east-1 | 0.542 |  |
| us-east-1 | 0.090 | 2 |
| us-east-2 | 0.100 |  |
| us-gov-east-1 | 0.097 | 1 |
| us-gov-west-1 | 0.334 |  |
| us-west-1 | 0.302 |  |
| us-west-2 | 0.312 |  |

