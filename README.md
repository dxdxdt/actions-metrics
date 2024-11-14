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
Updated: 2024-11-14T18:15:52.422616

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.883 |  |
| ap-east-1 | 0.855 |  |
| ap-northeast-1 | 0.673 |  |
| ap-northeast-2 | 0.778 |  |
| ap-south-1 | 0.857 |  |
| ap-southeast-1 | 0.945 |  |
| ap-southeast-2 | 0.815 |  |
| ca-central-1 | 0.125 |  |
| eu-central-1 | 0.412 |  |
| eu-north-1 | 0.457 |  |
| eu-south-1 | 0.437 |  |
| eu-west-1 | 0.359 |  |
| eu-west-2 | 0.363 |  |
| eu-west-3 | 0.382 |  |
| me-south-1 | 0.767 |  |
| sa-east-1 | 0.508 |  |
| us-east-1 | 0.061 | 14 |
| us-east-2 | 0.128 | 2 |
| us-gov-east-1 | 0.121 | 1 |
| us-gov-west-1 | 0.360 |  |
| us-west-1 | 0.285 | 4 |
| us-west-2 | 0.354 |  |

