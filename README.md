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
Updated: 2026-03-30T06:26:31.864295+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.911 |  |
| ap-east-1 | 0.756 |  |
| ap-east-2 | 0.692 |  |
| ap-northeast-1 | 0.586 |  |
| ap-northeast-2 | 0.698 |  |
| ap-northeast-3 | 0.610 |  |
| ap-south-1 | 0.860 |  |
| ap-south-2 | 0.904 |  |
| ap-southeast-1 | 0.852 |  |
| ap-southeast-2 | 0.750 |  |
| ap-southeast-3 | 0.911 |  |
| ap-southeast-4 | 0.828 |  |
| ap-southeast-5 | 0.864 |  |
| ap-southeast-6 | 0.826 |  |
| ap-southeast-7 | 0.961 |  |
| ca-central-1 | 0.154 | 16 |
| ca-west-1 | 0.285 |  |
| eu-central-1 | 0.421 |  |
| eu-central-2 | 0.447 |  |
| eu-north-1 | 0.490 |  |
| eu-south-1 | 0.456 |  |
| eu-south-2 | 0.465 |  |
| eu-west-1 | 0.356 |  |
| eu-west-2 | 0.393 |  |
| eu-west-3 | 0.404 |  |
| il-central-1 | 0.603 |  |
| me-central-1 | 0.798 |  |
| me-south-1 | 0.762 |  |
| mx-central-1 | 0.234 |  |
| sa-east-1 | 0.535 |  |
| us-east-1 | 0.097 | 4397 |
| us-east-2 | 0.110 | 1466 |
| us-gov-east-1 | 0.127 | 1615 |
| us-gov-west-1 | 0.279 | 190 |
| us-west-1 | 0.221 | 3318 |
| us-west-2 | 0.280 | 152 |

