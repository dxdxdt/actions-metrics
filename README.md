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
Updated: 2026-04-07T04:28:23.342839+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.945 |  |
| ap-east-1 | 0.745 |  |
| ap-east-2 | 0.681 |  |
| ap-northeast-1 | 0.647 |  |
| ap-northeast-2 | 0.662 |  |
| ap-northeast-3 | 0.590 |  |
| ap-south-1 | 0.846 |  |
| ap-south-2 | 0.855 |  |
| ap-southeast-1 | 0.832 |  |
| ap-southeast-2 | 0.728 |  |
| ap-southeast-3 | 0.879 |  |
| ap-southeast-4 | 0.767 |  |
| ap-southeast-5 | 0.841 |  |
| ap-southeast-6 | 0.772 |  |
| ap-southeast-7 | 0.932 |  |
| ca-central-1 | 0.181 | 16 |
| ca-west-1 | 0.267 |  |
| eu-central-1 | 0.456 |  |
| eu-central-2 | 0.477 |  |
| eu-north-1 | 0.511 |  |
| eu-south-1 | 0.483 |  |
| eu-south-2 | 0.487 |  |
| eu-west-1 | 0.379 |  |
| eu-west-2 | 0.421 |  |
| eu-west-3 | 0.439 |  |
| il-central-1 | 0.635 |  |
| me-central-1 | 0.825 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.244 |  |
| sa-east-1 | 0.566 |  |
| us-east-1 | 0.128 | 4452 |
| us-east-2 | 0.135 | 1487 |
| us-gov-east-1 | 0.145 | 1631 |
| us-gov-west-1 | 0.258 | 191 |
| us-west-1 | 0.203 | 3367 |
| us-west-2 | 0.258 | 154 |

