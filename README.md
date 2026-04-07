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
Updated: 2026-04-07T08:07:39.768035+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.024 |  |
| ap-east-1 | 0.673 |  |
| ap-east-2 | 0.616 |  |
| ap-northeast-1 | 0.602 |  |
| ap-northeast-2 | 0.591 |  |
| ap-northeast-3 | 0.521 |  |
| ap-south-1 | 0.904 |  |
| ap-south-2 | 0.899 |  |
| ap-southeast-1 | 0.752 |  |
| ap-southeast-2 | 0.641 |  |
| ap-southeast-3 | 0.806 |  |
| ap-southeast-4 | 0.679 |  |
| ap-southeast-5 | 0.766 |  |
| ap-southeast-6 | 0.685 |  |
| ap-southeast-7 | 0.853 |  |
| ca-central-1 | 0.244 | 16 |
| ca-west-1 | 0.201 |  |
| eu-central-1 | 0.547 |  |
| eu-central-2 | 0.554 |  |
| eu-north-1 | 0.599 |  |
| eu-south-1 | 0.558 |  |
| eu-south-2 | 0.572 |  |
| eu-west-1 | 0.470 |  |
| eu-west-2 | 0.509 |  |
| eu-west-3 | 0.517 |  |
| il-central-1 | 0.734 |  |
| me-central-1 | 0.923 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.228 |  |
| sa-east-1 | 0.649 |  |
| us-east-1 | 0.204 | 4452 |
| us-east-2 | 0.188 | 1487 |
| us-gov-east-1 | 0.187 | 1632 |
| us-gov-west-1 | 0.165 | 191 |
| us-west-1 | 0.111 | 3368 |
| us-west-2 | 0.165 | 154 |

