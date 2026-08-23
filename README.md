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
Updated: 2026-08-23T04:29:22.406442+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.025 |  |
| ap-east-1 | 0.661 |  |
| ap-east-2 | 0.602 |  |
| ap-northeast-1 | 0.482 |  |
| ap-northeast-2 | 0.586 |  |
| ap-northeast-3 | 0.509 |  |
| ap-south-1 | 0.900 |  |
| ap-south-2 | 0.907 |  |
| ap-southeast-1 | 0.734 |  |
| ap-southeast-2 | 0.626 |  |
| ap-southeast-3 | 0.792 |  |
| ap-southeast-4 | 0.669 |  |
| ap-southeast-5 | 0.757 |  |
| ap-southeast-6 | 0.661 |  |
| ap-southeast-7 | 0.842 |  |
| ca-central-1 | 0.261 | 18 |
| ca-west-1 | 0.200 |  |
| eu-central-1 | 0.541 |  |
| eu-central-2 | 0.566 |  |
| eu-north-1 | 0.592 |  |
| eu-south-1 | 0.566 |  |
| eu-south-2 | 0.580 |  |
| eu-west-1 | 0.462 |  |
| eu-west-2 | 0.516 |  |
| eu-west-3 | 0.519 |  |
| il-central-1 | 0.705 |  |
| me-central-1 | 0.901 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.221 |  |
| sa-east-1 | 0.670 |  |
| us-east-1 | 0.212 | 5048 |
| us-east-2 | 0.232 | 1681 |
| us-gov-east-1 | 0.199 | 1870 |
| us-gov-west-1 | 0.150 | 225 |
| us-west-1 | 0.096 | 4031 |
| us-west-2 | 0.149 | 184 |

