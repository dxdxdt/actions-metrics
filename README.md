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
Updated: 2024-12-13T15:12:54.492249

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.923 |  |
| ap-east-1 | 0.810 |  |
| ap-northeast-1 | 0.625 |  |
| ap-northeast-2 | 0.728 |  |
| ap-south-1 | 0.895 |  |
| ap-southeast-1 | 0.884 |  |
| ap-southeast-2 | 0.786 |  |
| ca-central-1 | 0.144 | 1 |
| eu-central-1 | 0.453 |  |
| eu-north-1 | 0.502 |  |
| eu-south-1 | 0.472 |  |
| eu-west-1 | 0.367 |  |
| eu-west-2 | 0.405 |  |
| eu-west-3 | 0.426 |  |
| me-south-1 | 0.802 |  |
| sa-east-1 | 0.556 |  |
| us-east-1 | 0.104 | 340 |
| us-east-2 | 0.135 | 83 |
| us-gov-east-1 | 0.115 | 58 |
| us-gov-west-1 | 0.302 |  |
| us-west-1 | 0.272 | 201 |
| us-west-2 | 0.295 |  |

