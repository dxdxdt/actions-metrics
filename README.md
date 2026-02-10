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
Updated: 2026-02-10T20:38:47.019647+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.968 |  |
| ap-east-1 | 0.732 |  |
| ap-northeast-1 | 0.542 |  |
| ap-northeast-2 | 0.645 |  |
| ap-south-1 | 0.895 |  |
| ap-south-2 | 0.927 |  |
| ap-southeast-1 | 0.801 |  |
| ap-southeast-2 | 0.708 |  |
| ap-southeast-3 | 0.849 |  |
| ap-southeast-4 | 0.752 |  |
| ca-central-1 | 0.171 | 16 |
| ca-west-1 | 0.211 |  |
| eu-central-1 | 0.478 |  |
| eu-central-2 | 0.490 |  |
| eu-north-1 | 0.533 |  |
| eu-south-1 | 0.511 |  |
| eu-south-2 | 0.514 |  |
| eu-west-1 | 0.399 |  |
| eu-west-2 | 0.439 |  |
| eu-west-3 | 0.453 |  |
| il-central-1 | 0.655 |  |
| me-central-1 | 0.879 |  |
| me-south-1 | 0.836 |  |
| sa-east-1 | 0.572 |  |
| us-east-1 | 0.132 | 4098 |
| us-east-2 | 0.118 | 1330 |
| us-gov-east-1 | 0.121 | 1449 |
| us-gov-west-1 | 0.215 | 142 |
| us-west-1 | 0.199 | 3037 |
| us-west-2 | 0.211 | 125 |

