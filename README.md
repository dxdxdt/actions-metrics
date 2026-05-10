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
Updated: 2026-05-10T18:50:35.445469+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.925 |  |
| ap-east-1 | 0.787 |  |
| ap-east-2 | 0.716 |  |
| ap-northeast-1 | 0.603 |  |
| ap-northeast-2 | 0.701 |  |
| ap-northeast-3 | 0.630 |  |
| ap-south-1 | 0.865 |  |
| ap-south-2 | 0.936 |  |
| ap-southeast-1 | 0.859 |  |
| ap-southeast-2 | 0.762 |  |
| ap-southeast-3 | 0.907 |  |
| ap-southeast-4 | 0.801 |  |
| ap-southeast-5 | 0.881 |  |
| ap-southeast-6 | 0.794 |  |
| ap-southeast-7 | 0.965 |  |
| ca-central-1 | 0.100 | 16 |
| ca-west-1 | 0.230 |  |
| eu-central-1 | 0.431 |  |
| eu-central-2 | 0.447 |  |
| eu-north-1 | 0.474 |  |
| eu-south-1 | 0.451 |  |
| eu-south-2 | 0.469 |  |
| eu-west-1 | 0.350 |  |
| eu-west-2 | 0.392 |  |
| eu-west-3 | 0.415 |  |
| il-central-1 | 0.585 |  |
| me-central-1 | 0.825 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.221 |  |
| sa-east-1 | 0.531 |  |
| us-east-1 | 0.076 | 4622 |
| us-east-2 | 0.067 | 1586 |
| us-gov-east-1 | 0.071 | 1685 |
| us-gov-west-1 | 0.277 | 195 |
| us-west-1 | 0.227 | 3547 |
| us-west-2 | 0.278 | 157 |

