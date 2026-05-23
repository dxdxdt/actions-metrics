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
Updated: 2026-05-23T08:59:06.182685+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.971 |  |
| ap-east-1 | 0.704 |  |
| ap-east-2 | 0.638 |  |
| ap-northeast-1 | 0.521 |  |
| ap-northeast-2 | 0.625 |  |
| ap-northeast-3 | 0.550 |  |
| ap-south-1 | 0.890 |  |
| ap-south-2 | 0.903 |  |
| ap-southeast-1 | 0.780 |  |
| ap-southeast-2 | 0.693 |  |
| ap-southeast-3 | 0.835 |  |
| ap-southeast-4 | 0.725 |  |
| ap-southeast-5 | 0.803 |  |
| ap-southeast-6 | 0.718 |  |
| ap-southeast-7 | 0.886 |  |
| ca-central-1 | 0.212 | 16 |
| ca-west-1 | 0.238 |  |
| eu-central-1 | 0.496 |  |
| eu-central-2 | 0.510 |  |
| eu-north-1 | 0.536 |  |
| eu-south-1 | 0.517 |  |
| eu-south-2 | 0.519 |  |
| eu-west-1 | 0.411 |  |
| eu-west-2 | 0.461 |  |
| eu-west-3 | 0.466 |  |
| il-central-1 | 0.648 |  |
| me-central-1 | 0.886 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.221 |  |
| sa-east-1 | 0.600 |  |
| us-east-1 | 0.154 | 4677 |
| us-east-2 | 0.170 | 1607 |
| us-gov-east-1 | 0.155 | 1702 |
| us-gov-west-1 | 0.212 | 195 |
| us-west-1 | 0.154 | 3588 |
| us-west-2 | 0.206 | 159 |

