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
Updated: 2026-02-10T17:04:15.512559+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.045 |  |
| ap-east-1 | 0.656 |  |
| ap-northeast-1 | 0.474 |  |
| ap-northeast-2 | 0.587 |  |
| ap-south-1 | 0.899 |  |
| ap-south-2 | 0.881 |  |
| ap-southeast-1 | 0.732 |  |
| ap-southeast-2 | 0.611 |  |
| ap-southeast-3 | 0.786 |  |
| ap-southeast-4 | 0.648 |  |
| ca-central-1 | 0.286 | 16 |
| ca-west-1 | 0.183 |  |
| eu-central-1 | 0.554 |  |
| eu-central-2 | 0.581 |  |
| eu-north-1 | 0.619 |  |
| eu-south-1 | 0.598 |  |
| eu-south-2 | 0.606 |  |
| eu-west-1 | 0.476 |  |
| eu-west-2 | 0.529 |  |
| eu-west-3 | 0.506 |  |
| il-central-1 | 0.749 |  |
| me-central-1 | 0.944 |  |
| me-south-1 | 0.907 |  |
| sa-east-1 | 0.670 |  |
| us-east-1 | 0.232 | 4097 |
| us-east-2 | 0.212 | 1329 |
| us-gov-east-1 | 0.213 | 1449 |
| us-gov-west-1 | 0.135 | 142 |
| us-west-1 | 0.086 | 3036 |
| us-west-2 | 0.138 | 125 |

