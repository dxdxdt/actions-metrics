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
Updated: 2026-08-12T03:58:16.429747+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 1.074 |  |
| ap-east-1 | 0.616 |  |
| ap-east-2 | 0.556 |  |
| ap-northeast-1 | 0.439 |  |
| ap-northeast-2 | 0.548 |  |
| ap-northeast-3 | 0.465 |  |
| ap-south-1 | 0.905 |  |
| ap-south-2 | 0.857 |  |
| ap-southeast-1 | 0.695 |  |
| ap-southeast-2 | 0.579 |  |
| ap-southeast-3 | 0.751 |  |
| ap-southeast-4 | 0.623 |  |
| ap-southeast-5 | 0.712 |  |
| ap-southeast-6 | 0.625 |  |
| ap-southeast-7 | 0.794 |  |
| ca-central-1 | 0.327 | 18 |
| ca-west-1 | 0.166 |  |
| eu-central-1 | 0.595 |  |
| eu-central-2 | 0.615 |  |
| eu-north-1 | 0.655 |  |
| eu-south-1 | 0.621 |  |
| eu-south-2 | 0.627 |  |
| eu-west-1 | 0.518 |  |
| eu-west-2 | 0.550 |  |
| eu-west-3 | 0.579 |  |
| il-central-1 | 0.744 |  |
| me-central-1 | 0.956 |  |
| me-south-1 | 0.791 |  |
| mx-central-1 | 0.245 |  |
| sa-east-1 | 0.712 |  |
| us-east-1 | 0.263 | 4976 |
| us-east-2 | 0.310 | 1679 |
| us-gov-east-1 | 0.303 | 1822 |
| us-gov-west-1 | 0.101 | 219 |
| us-west-1 | 0.056 | 3929 |
| us-west-2 | 0.100 | 176 |

