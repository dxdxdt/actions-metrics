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
Updated: 2026-03-14T04:04:48.106688+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.945 |  |
| ap-east-1 | 0.756 |  |
| ap-east-2 | 0.695 |  |
| ap-northeast-1 | 0.572 |  |
| ap-northeast-2 | 0.689 |  |
| ap-northeast-3 | 0.594 |  |
| ap-south-1 | 0.875 |  |
| ap-south-2 | 0.924 |  |
| ap-southeast-1 | 0.823 |  |
| ap-southeast-2 | 0.734 |  |
| ap-southeast-3 | 0.886 |  |
| ap-southeast-4 | 0.772 |  |
| ap-southeast-5 | 0.854 |  |
| ap-southeast-6 | 0.772 |  |
| ap-southeast-7 | 0.945 |  |
| ca-central-1 | 0.133 | 16 |
| ca-west-1 | 0.226 |  |
| eu-central-1 | 0.445 |  |
| eu-central-2 | 0.464 |  |
| eu-north-1 | 0.496 |  |
| eu-south-1 | 0.477 |  |
| eu-south-2 | 0.486 |  |
| eu-west-1 | 0.375 |  |
| eu-west-2 | 0.407 |  |
| eu-west-3 | 0.426 |  |
| il-central-1 | 0.634 |  |
| me-central-1 | 0.855 |  |
| me-south-1 | 0.776 |  |
| mx-central-1 | 0.225 |  |
| sa-east-1 | 0.549 |  |
| us-east-1 | 0.100 | 4278 |
| us-east-2 | 0.095 | 1422 |
| us-gov-east-1 | 0.097 | 1573 |
| us-gov-west-1 | 0.238 | 183 |
| us-west-1 | 0.230 | 3221 |
| us-west-2 | 0.235 | 146 |

