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
Updated: 2026-03-31T16:01:00.174286+00:00

| AWS Region | Avg Latency | Least |
| - | - | - |
| af-south-1 | 0.909 |  |
| ap-east-1 | 0.787 |  |
| ap-east-2 | 0.712 |  |
| ap-northeast-1 | 0.596 |  |
| ap-northeast-2 | 0.712 |  |
| ap-northeast-3 | 0.639 |  |
| ap-south-1 | 0.853 |  |
| ap-south-2 | 0.939 |  |
| ap-southeast-1 | 0.843 |  |
| ap-southeast-2 | 0.765 |  |
| ap-southeast-3 | 0.905 |  |
| ap-southeast-4 | 0.813 |  |
| ap-southeast-5 | 0.863 |  |
| ap-southeast-6 | 0.847 |  |
| ap-southeast-7 | 0.956 |  |
| ca-central-1 | 0.116 | 16 |
| ca-west-1 | 0.266 |  |
| eu-central-1 | 0.428 |  |
| eu-central-2 | 0.442 |  |
| eu-north-1 | 0.483 |  |
| eu-south-1 | 0.448 |  |
| eu-south-2 | 0.467 |  |
| eu-west-1 | 0.347 |  |
| eu-west-2 | 0.385 |  |
| eu-west-3 | 0.410 |  |
| il-central-1 | 0.595 |  |
| me-central-1 | 0.802 |  |
| me-south-1 | 0.772 |  |
| mx-central-1 | 0.229 |  |
| sa-east-1 | 0.528 |  |
| us-east-1 | 0.080 | 4407 |
| us-east-2 | 0.093 | 1469 |
| us-gov-east-1 | 0.090 | 1618 |
| us-gov-west-1 | 0.282 | 190 |
| us-west-1 | 0.218 | 3325 |
| us-west-2 | 0.292 | 152 |

